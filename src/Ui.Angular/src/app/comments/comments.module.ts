import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { DxButtonModule, DxHtmlEditorModule, DxPopupModule, DxScrollViewModule } from 'devextreme-angular';

import { CommentsComponent } from './comments.component';
import { CommentsService } from './comments.service';

@NgModule({
	imports: [
		CommonModule,
		DxHtmlEditorModule,
		DxPopupModule,
		DxButtonModule,
		DxScrollViewModule
	],
	exports: [CommentsComponent],
	providers: [CommentsService],
	declarations: [CommentsComponent]
})
export class CommentsModule {
}
