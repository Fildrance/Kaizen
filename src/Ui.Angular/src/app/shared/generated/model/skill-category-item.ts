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
import { SkillItem } from './skill-item';

export interface SkillCategoryItem { 
    Id?: number;
    IsActive?: boolean;
    Name?: string;
    ShortDescription?: string;
    Items?: Array<SkillItem>;
    NodeType?: SkillAggregationLevel;
}