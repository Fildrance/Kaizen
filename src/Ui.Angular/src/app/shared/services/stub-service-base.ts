export abstract class StubCrudServiceBase<T>{
	protected nextId: number = 1;

	protected store: Array<T>;

	constructor() {
		this.store = this.fillStore();
	}

	protected abstract fillStore(): Array<T>;

	protected getNextId(): number {
		const id = this.nextId;
		this.nextId++;
		return id;
	}
}
