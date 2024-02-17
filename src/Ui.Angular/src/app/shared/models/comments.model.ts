/* eslint-disable */
// TypeScriptContractGenerator's generated content

export type CommentCreateContract = {
    SubjectType?: null | string;
    SubjectKey?: null | string;
    CommentText?: null | string;
};
export type CommentDeleteContract = {
    ToDelete?: null | CommentSelector;
};
export type CommentFilter = {
    SubjectType?: null | string;
    SubjectKey?: null | string;
};
export type CommentUpdateContract = {
    CommentText?: null | string;
    ToUpdate?: null | CommentSelector;
};
export type CommentItem = {
    Id?: string;
    SubjectType?: null | string;
    SubjectKey?: null | string;
    CommentText?: null | string;
    On?: (Date | string);
};
export type CommentSelector = {
    Id?: null | string;
};
