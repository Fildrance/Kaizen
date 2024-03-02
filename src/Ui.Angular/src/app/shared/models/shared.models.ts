/* eslint-disable */
// TypeScriptContractGenerator's generated content

export type FilterContractBase = {
    Take?: null | number;
    Skip?: null | number;
};
export type EmptyResponse = {
};
export type Page<T> = {
    Items?: Array<null | T>;
    TotalCount?: number;
};
export interface TreeItem<T> {
	NodeType: string;
	Name: string;
	IsActive: boolean;
	Id: number;
	Items?: TreeItem<any>[]
}
export type IReadOnlyCollection<T> = {
    Count?: number;
};
