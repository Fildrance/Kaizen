import { Component, Input, NgModule } from '@angular/core';

@Component({
	selector: 'app-single-card',
	templateUrl: './single-card.component.html',
	styleUrls: ['./single-card.component.scss']
})
export class SingleCardComponent {
	@Input()
	public headerText: string;

	constructor() { }
}
