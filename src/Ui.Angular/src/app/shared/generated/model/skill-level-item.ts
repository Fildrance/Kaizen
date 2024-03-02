/**
 * Kaizen.Skills.Service
 * No description provided (generated by Swagger Codegen https://github.com/swagger-api/swagger-codegen)
 *
 * OpenAPI spec version: latest
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */
import { SkillAggregationLevel } from './skill-aggregation-level';
import { SkillLevelPrerequisiteItem } from './skill-level-prerequisite-item';

export interface SkillLevelItem { 
    Id?: number;
    IsActive?: boolean;
    Name?: string;
    ShortDescription?: string;
    Weight?: number;
    Description?: string;
    Prerequisites?: Array<SkillLevelPrerequisiteItem>;
    NodeType?: SkillAggregationLevel;
}