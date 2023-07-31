import { IBusinessResultsResponse } from "./business_results_response";

export interface IBusinessResponse {
    status: string;
    results: IBusinessResultsResponse;
}