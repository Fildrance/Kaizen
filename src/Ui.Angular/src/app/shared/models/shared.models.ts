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
export type IList<T> = {
    Item?: null | T;
};
export type IReadOnlyCollection<T> = {
    Count?: number;
};
