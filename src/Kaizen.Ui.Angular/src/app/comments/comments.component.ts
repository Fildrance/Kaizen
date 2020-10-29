import { Component, Input } from '@angular/core';
import { CommentCreateContract, CommentDeleteContract, CommentFilter, CommentItem, CommentUpdateContract } from './comments.model';
import { CommentsService } from './comments.service';

@Component({
	selector: 'kai-comments',
	templateUrl: 'comments.component.html'
})
export class CommentsComponent {

	private _subjectKey: string = undefined;
	private _subjectType: string = undefined;
	private commentToBeDeleted: CommentItem;
	private editedCommentPreviousText: string;

	public itemUnderEdit: CommentItem;
	public isExistEditComment: boolean;
	public isPopupVisible: boolean;


	@Input()
	public set subjectKey(value: string) {
		this._subjectKey = value;
		this.tryGetComments();
	}
	@Input()
	public set subjectType(value: string) {
		this._subjectType = value;
		this.tryGetComments();
	}

	public Comments: Array<CommentItem>;
	public editPopupVisible: boolean;
	public editorValue: string;

	constructor(private service: CommentsService) {
	}

	public addComment(): void {
		const contract: CommentCreateContract = {
			CommentText: this.editorValue,
			SubjectKey: this._subjectKey.toString(),
			SubjectType: this._subjectType
		};
		this.service.create(contract).subscribe(x => {
			this.tryGetComments();
		});
	}

	public deleteCommentStart(item: CommentItem): void {
		this.commentToBeDeleted = item;
		this.isPopupVisible = true;
	}

	public deleteUndo(): void {
		this.commentToBeDeleted = null;
		this.isPopupVisible = false;
		this.isExistEditComment = false;
	}

	public markForUpdate(data: CommentItem): void {
		this.itemUnderEdit = data;
		this.editedCommentPreviousText = data.CommentText;
		this.isExistEditComment = true;
		this.editPopupVisible = true;
	}

	public cancelEdit(data: CommentItem): void {
		data.CommentText = this.editedCommentPreviousText;
		this.isExistEditComment = false;
		this.editPopupVisible = false;
	}

	public updateComment(data: CommentItem): void {
		if (data == null || data.CommentText === '') {
			return;
		}

		const updateContract: CommentUpdateContract = {
			ToUpdate: { Id: data.Id },
			CommentText: data.CommentText
		};
		this.service.update(updateContract)
			.subscribe(x => this.tryGetComments());

		this.isExistEditComment = false;
		this.editPopupVisible = false;
	}

	public deleteComment(): void {
		const deleteContract: CommentDeleteContract = {
			ToDelete: { Id: this.commentToBeDeleted.Id }
		};

		this.service.delete(deleteContract).subscribe(x => {
			this.isPopupVisible = false;
			return;
		});

		const index = this.Comments.indexOf(this.commentToBeDeleted);
		if (index > -1) {
			this.Comments.splice(index, 1);
		}

		this.isPopupVisible = false;
	}

	private tryGetComments(): void {
		if (this._subjectType === undefined || this._subjectKey === undefined) {
			return;
		}

		const filter: CommentFilter = {
			SubjectKey: this._subjectKey.toString(),
			SubjectType: this._subjectType
		};
		this.service.query(filter).subscribe(x => {
			this.Comments = x.Items;
		});
	}
}
