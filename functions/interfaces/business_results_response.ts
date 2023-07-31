import { IBusiness } from "./business";

export interface IBusinessResultsResponse {
    data: IBusiness[];
    total: number;
}