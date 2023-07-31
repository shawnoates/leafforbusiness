const functions = require('firebase-functions');
const yelp = require('api')('@yelp-developers/v1.0#deudoolf6o9f51');
const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY_LIVE);

const { v4: uuidv4 } = require('uuid');

const admin = require('firebase-admin');
admin.initializeApp();

const formData = require('form-data');
const Mailgun = require('mailgun.js');
const fs = require('fs');

const express = require('express');
const cors = require("cors");

const app = express();

app.use(cors());
app.use(express.json());

app.post('/business-search', async (req, res) => {
    yelp.auth('Bearer ' + process.env.YELP_API_KEY);

    const location = req.body.location;
    const term = req.body.term;

    try {
        let results = await yelp.v3_business_search({
            location: location,
            term: term,
            sort_by: 'best_match',
            limit: '20',
        });
        res.send({
            'status': 'success',
            'results': results,
        });
    } catch (error) {
        res.send({
            'status': 'failure',
            'message': error,
        });
    }

});

app.post('/stripe-checkout', async (req, res) => {
    try {
        const uuid = uuidv4();
        const orderNumber = 'LFB-' + uuid;

        const order = {
            order_number: orderNumber,
            status: 'PENDING',
            ...req.body,
        }

        let baseUrl = req.query.env == 'prod' ? 'https://leaf-for-business.web.app' : 'http://localhost:3030';
        const session = await stripe.checkout.sessions.create({
            line_items: [
                {
                    price_data: {
                        currency: 'usd',
                        product_data: {
                            name: 'Promotion Payment',
                        },
                        unit_amount: req.query.amount * 100, /// 1USD = 100 Cents
                    },
                    quantity: 1,
                }
            ],
            mode: 'payment',
            payment_method_types: ["card"],
            success_url: baseUrl + '/order-confirmation?orderId={CHECKOUT_SESSION_ID}',
        });

        await admin.firestore()
            .collection("orders")
            .doc(session.id)
            .set({
                session_id: session.id,
                ...order,
            });

        res.send({
            success: true,
            session_id: session.id,
            redirect_url: session.url,
        });

    } catch (error) {
        res.status(404).send({
            success: false,
            error: error.message,
        });
    }
});


app.post('/webhook', express.json({ type: 'application/json' }), (request, response) => {
    const sig = request.headers['stripe-signature'];

    const endpointSecret = process.env.WEBHOOK_SECRET;
    let event;

    try {
        event = stripe.webhooks.constructEvent(request.rawBody, sig, endpointSecret);
    } catch (err) {
        admin.firestore()
            .collection('orders')
            .data(dataObject.id)
            .update({ status: 'FAILED' })

        response.status(400).send(`Webhook Error: ${err.message}`);
        return;
    }

    // Handle the event
    switch (event.type) {
        case 'checkout.session.completed':
            const dataObject = event.data.object;

            /// All of these must be in a sequence to avoid crash on webhook
            /// seq:
            // fetch order
            // send customer - order confirmation
            // send admin - new order placed
            // updated order status - 'success'
            admin.firestore()
                .collection('orders')
                .doc(dataObject.id)
                .get().then((raw) => {
                    // customer email
                    sendEmail(raw.data()).then(() => {
                        // admin email
                        sendAdminEmail(raw.data()).then(() => {
                            // status update
                            admin.firestore()
                                .collection('orders')
                                .doc(dataObject.id)
                                .update({ status: 'SUCCESS' })
                        });
                    });
                });

            break;
        default:
            console.log(`Unhandled event type ${event.type}`);
    }

    // Return a 200 response to acknowledge receipt of the event
    response.send();
});

async function sendEmail(body) {
    const DOMAIN = "app.joinleaf.com";
    const SENDER_EMAIL = "no-reply@app.joinleaf.com";

    const mailgun = new Mailgun(formData);
    const mg = mailgun.client({
        username: 'api',
        key: process.env.MG_PRIVATE_KEY,
        host: "api.eu.mailgun.net",
    });

    const customerEmail = body.customer_email;
    const customerName = body.customer_name;
    const orderNumber = body.order_number;

    //
    const startDate = body.start_date;
    const endDate = body.end_date;

    const emailBody = fs.readFileSync('src/email.html', 'utf8').toString();
    const finalTemp = emailBody.replaceAll('customer-name', customerName)
        .replace('order-number', orderNumber)
        .replace('start-date', startDate)
        .replace('end-date', endDate);


    /// Email to customer as confirmation
    const messageData = {
        from: SENDER_EMAIL,
        to: [customerEmail],
        Bcc: ["getleaflets.co", "team@getleaflets.co"],
        subject: "Thank you for your purchase.",
        html: finalTemp,
    };

    const resp = await mg.messages.create(DOMAIN, messageData, (err, body) => {
        if (!err) {
            console.log('Sent! ' + body);
        } else {
            console.log(err);
        }
    });

    return resp;
}

async function sendAdminEmail(body) {
    const DOMAIN = "app.joinleaf.com";
    const SENDER_EMAIL = "no-reply@app.joinleaf.com";

    const mailgun = new Mailgun(formData);
    const mg = mailgun.client({
        username: 'api',
        key: process.env.MG_PRIVATE_KEY,
        host: "api.eu.mailgun.net",
    });

    const businessId = body.business.id;
    const businessName = body.business.name;
    const headline = body.headline;

    // 
    const loc = body.business.location;
    const location = loc.display_address[0] + " " + loc.display_address[1];

    const locationNotes = body.location_notes;
    const startingDate = body.start_date;
    const endingDate = body.end_date;

    const emailBody = fs.readFileSync('src/adminEmail.html', 'utf8').toString();
    const finalTemp = emailBody.replaceAll('b-name', businessName)
        .replaceAll('b-id', businessId)
        .replace('b-headline', headline)
        .replace('b-location', location)
        .replace('b-location-notes', locationNotes)
        .replace('b-start', startingDate)
        .replace('b-end', endingDate);


    /// Email to Admins for new order
    const messageData = {
        from: SENDER_EMAIL,
        to: ["orders@getleaflets.co"],
        subject: "New order placed!",
        html: finalTemp,
    };

    const resp = await mg.messages.create(DOMAIN, messageData, (err, body) => {
        if (!err) {
            console.log('Sent! ' + body);
        } else {
            console.log(err);
        }
    });

    return resp;
}

app.post('/send-email', async (req, res) => {
    try {
        const resp = await sendEmail(req.body);
        res.send({
            success: true,
            data: resp,
        })
    } catch (error) {
        res.send({
            status: false,
            message: error,
        });
    }
});


exports.api = functions.https.onRequest(app);
