export interface ILocation {
    address1: string;
    address2?: string | null;
    address3?: string | null;
    city: string;
    country: string;
    state: string;
    display_address: string[];
}