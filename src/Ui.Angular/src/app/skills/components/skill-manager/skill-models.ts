import { SkillAggregationLevel, SkillTreeItem, TreeItem } from "src/app/shared/models/skill.model";
import { TreeNodeViewModel } from "src/app/shared/models/util.models";

export class SkillTreeItemViewModel<TChildType extends TreeNodeViewModel<any, SkillAggregationLevel>> implements TreeNodeViewModel<any, SkillAggregationLevel> {
	private _original: SkillTreeItem;

	public IsSelected?: boolean;
	public IsExpanded?: boolean;

	constructor(original: SkillTreeItem) {
		this._original = original;
	}

	set original(value: TreeItem<SkillAggregationLevel>) {
		this._original = value;
	}

	public Parent: TreeNodeViewModel<any, SkillAggregationLevel>;

	public get Id(): number {
		return this._original.Id;
	}

	public get Name(): string {
		return this._original.Name;
	}

	public set Name(value: string) {
		this._original.Name = value;
	}

	public get IsActive(): boolean {
		return this._original.IsActive;
	}

	public set IsActive(value: boolean) {
		this._original.IsActive = value;
	}

	public Items: TChildType[];

	public get NodeType(): SkillAggregationLevel {
		return SkillAggregationLevel[this._original.NodeType];
	}

	ItemsFilter?: (items?: TreeNodeViewModel<TChildType, SkillAggregationLevel>[]) => void;

	public static create(original: SkillTreeItem): SkillTreeItemViewModel<any> {
		let newOne = new SkillTreeItemViewModel(original);
		let items = original.Items;
		if (!items || items.length == 0) {
			return newOne;
		}

		newOne.Items = items.map(nested => {
			let nestedNewOne = SkillTreeItemViewModel.create(nested)
			nestedNewOne.Parent = newOne;
			return nestedNewOne;
		});
		return newOne;
	}
}
