import { SkillLevelPrerequisiteItem } from "../../shared/generated/model/skill-level-prerequisite-item";
import { SkillLevelPrerequisiteViewModel } from "../components/skill-level/skill-level.component";
import { SkillTreeListItem } from "./skill-tree-list-item";

export class PrerequisiteChain {
	private fullList: SkillLevelPrerequisiteViewModel[];
	private directList: SkillLevelPrerequisiteViewModel[];
	private map: Map<number, SkillLevelPrerequisiteViewModel[]> = new Map();

	constructor(
		private owner: { Prerequisites?: Array<SkillLevelPrerequisiteItem> },
		private prerequisiteFullList: SkillLevelPrerequisiteItem[],
		private skillLevels: SkillTreeListItem[]
	) {
		this.updateLists()
	}

	public getDirect(): SkillLevelPrerequisiteViewModel[] {
		return this.directList;
	}

	public getFull(): SkillLevelPrerequisiteViewModel[] {
		return this.fullList;
	}

	public remove(item: SkillLevelPrerequisiteViewModel): void {
		let index = this.owner.Prerequisites.findIndex(x => x.RequiredSkillId == item.RequiredSkillId && x.ForSkillLevelId == item.ForSkillLevelId);
		if (index >= 0) {
			this.owner.Prerequisites.splice(index, 1);
		}
		this.updateLists();
	}

	public add(item: SkillLevelPrerequisiteViewModel): void {
		this.owner.Prerequisites.push(
			{
				ForSkillLevelId: item.ForSkillLevelId,
				RequiredSkillId: item.RequiredSkillId
			}
		);
		this.updateLists();
	}

	private updateLists() {
		if (!this.owner.Prerequisites) {
			return;
		}

		this.directList = this.owner.Prerequisites.map(x => new SkillLevelPrerequisiteViewModel(x, this.skillLevels))

		this.fullList = [];
		this.map.clear();
		for (const prerequisite of this.owner.Prerequisites) {
			let viewModel = new SkillLevelPrerequisiteViewModel(prerequisite, this.skillLevels);
			this.fullList.push(...this.extractPrerequisiteTree(viewModel, this.prerequisiteFullList, this.skillLevels, this.map));
		}
	}

	private extractPrerequisiteTree(
		prerequisite: SkillLevelPrerequisiteViewModel,
		fullList: SkillLevelPrerequisiteItem[],
		skillsLevels: SkillTreeListItem[],
		map: Map<number, SkillLevelPrerequisiteViewModel[]>
	): SkillLevelPrerequisiteViewModel[] {
		const list = [prerequisite];
		const foundNext = fullList.filter(x => x.ForSkillLevelId == prerequisite.RequiredSkillId);
		if (foundNext && foundNext.length) {
			for (const next of foundNext) {
				const viewModel = new SkillLevelPrerequisiteViewModel(next, skillsLevels)
				if (map.has(viewModel.ForSkillLevelId)) {
					map.get(viewModel.ForSkillLevelId).push(viewModel);
				} else {
					map.set(viewModel.ForSkillLevelId, [viewModel]);
				}
				list.push(...this.extractPrerequisiteTree(viewModel, fullList, skillsLevels, map))
			}

		}
		return list;
	}
}

export class PrerequisiteChainBuilder {

	constructor(
		private skillLevels: SkillTreeListItem[],
		private prerequisiteFullList: SkillLevelPrerequisiteItem[]
	) {
	}

	public withListOwner(owner: { Prerequisites?: Array<SkillLevelPrerequisiteItem> }): PrerequisiteChain {
		return new PrerequisiteChain(owner, this.prerequisiteFullList, this.skillLevels)
	}
}
