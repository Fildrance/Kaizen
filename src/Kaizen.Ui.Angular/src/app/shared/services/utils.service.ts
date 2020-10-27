import { TreeNode, SkillBase } from '../../../app/skills/models/skill-models';

export function HasId(item: { Id?: number }): boolean {
	return item.Id === 0 || item.Id > 0;
}

export function searchInTree(
	rootNodes: Array<TreeNode<any> & SkillBase>,
	idToFind: number,
	tierToBeSearched: string
): TreeNode<any> & SkillBase {
	if (tierToBeSearched === 'skill-category') {
		return rootNodes.find(i => i.Id === idToFind);
	} else if (tierToBeSearched === 'skill') {
		return findSkillById(rootNodes, idToFind);
	} else if (tierToBeSearched === 'skill-level') {
		return findSkillLevelById(rootNodes, idToFind);
	}
}

export function findSkillById(items: Array<TreeNode<any> & SkillBase>, id: number): TreeNode<any> & SkillBase {
	let found;
	for (const iterator of items) {
		if (iterator.Items) {
			found = iterator.Items.find((i: TreeNode<any>) => i.Id === id);
			if (found) {
				break;
			}
		}
	}
	return found;
}

export function findSkillLevelById(skillCats: Array<TreeNode<any> & SkillBase>, id: number): TreeNode<any> & SkillBase {
	let found;
	for (const skillCat of skillCats) {
		for (const skill of skillCat.Items) {
			if (skill.Items) {
				found = skill.Items.find((i: TreeNode<any>) => i.Id === id);
				if (found) {
					break;
				}
			}
		}
	}
	return found;
}
