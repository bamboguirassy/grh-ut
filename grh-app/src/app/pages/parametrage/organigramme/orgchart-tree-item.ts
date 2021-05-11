export class OrgchartTreeItem<T> {
    name: string;
    cssClass: string;
    image: string;
    title: string;
    data: T;
    childs: OrgchartTreeItem<T>[]
}