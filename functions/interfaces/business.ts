import { ICategory } from './category';
import { ICoordinates } from './coordinates';
import { ILocation } from './location';

export interface IBusiness {
    id: string;
    alias: string;
    name: string;
    image_url: string;
    is_closed: boolean;
    url: string;
    review_count: number;
    categories: ICategory[];
    ratings?: number | null;
    coordinates: ICoordinates;
    price?: string | null;
    location: ILocation;
    phone: string;
    display_phone: string;
    distance: number;
}