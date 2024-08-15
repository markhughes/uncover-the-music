export class Repo<T = any, ChildRepos extends Record<string, any> = any> {
  private items: Map<string, T> = new Map();
  private childRepos: Map<string, any> = new Map();

  constructor(
    initialItems?: [string, T][],
    initialChildRepos?: [string, any][]
  ) {
    if (initialItems) {
      for (const [key, item] of initialItems) {
        this.addItem(key, item);
      }
    }

    if (initialChildRepos) {
      for (const [key, childRepo] of initialChildRepos) {
        this.addChildRepo(key as keyof ChildRepos, childRepo);
      }
    }
  }

  addItem(key: string, item: T) {
    this.items.set(key, item);
  }

  getItem(key: string): T | undefined {
    const item = this.items.get(key);
    if (!item) {
      console.warn('Repo.getItem', `Item ${key} not found`);
    }
    return item;
  }

  getAllItems(): Record<string, T> {
    return Object.freeze(Object.fromEntries(this.items.entries()));
  }

  // Children

  addChildRepo<K extends keyof ChildRepos>(key: K, childRepo: ChildRepos[K]) {
    this.childRepos.set(key as string, childRepo);
  }

  getChild<K extends keyof T>(key: string, childKey: K): T[K] | undefined {
    const item = this.items.get(key);
    return item ? item[childKey] : undefined;
  }

  getChildRepo<K extends keyof ChildRepos>(key: K): ChildRepos[K] | undefined {
    return this.childRepos.get(key as string) as ChildRepos[K];
  }
}
