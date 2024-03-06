import { Injectable } from "@angular/core";

const subPathByDropMethod = [] as { predicate: (url: string) => boolean, updateMethod: () => void }[];

export function invalidateCacheIfRequired(url: string): void {
	for (const iterator of subPathByDropMethod) {
		if (iterator.predicate(url)) {
			iterator.updateMethod();
		}
	}
}

@Injectable()
export class CacheService {

	public addDropByIncludes(subPath: string, updateMethod: () => void): void {
		subPathByDropMethod.push({ predicate: url => url.includes(subPath), updateMethod });
	}

	public addDropByEndsWith(subPath: string, updateMethod: () => void): void {
		subPathByDropMethod.push({ predicate: url => url.endsWith(subPath), updateMethod });
	}

	public invalidateCacheIfRequired(url: string): void {
		invalidateCacheIfRequired(url);
	}

}
