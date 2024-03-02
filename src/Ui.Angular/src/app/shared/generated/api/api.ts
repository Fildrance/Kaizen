export * from './skill-categories';
import { SkillCategoriesService } from './skill-categories';
export * from './skill-levels';
import { SkillLevelsService } from './skill-levels';
export * from './skills';
import { SkillsService } from './skills';
export const APIS = [SkillCategoriesService, SkillLevelsService, SkillsService];
