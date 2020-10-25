export function HasId(item: { Id?: number }): boolean {
	return item.Id === 0 || item.Id > 0;
}
