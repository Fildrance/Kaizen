export interface CommentItem {
	Id: string;
	SubjectKey: string;
	SubjectType: string;
	CommentText: string;
	On: Date;
}

export interface CommentCreateContract {
	SubjectKey: string;
	SubjectType: string;
	CommentText: string;
}

export interface CommentDeleteContract {
	ToDelete: { Id: string };
}

export interface CommentUpdateContract {
	CommentText: string;
	ToUpdate: { Id: string };
}

export interface CommentFilter {
	SubjectKey: string;
	SubjectType: string;
}
