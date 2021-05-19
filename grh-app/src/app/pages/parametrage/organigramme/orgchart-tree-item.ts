export class OrgchartTreeItem<T> {
    name: string;
    cssClass: string;
    image: string;
    title: string;
    data: T;
    nodeType?: string;
    hasChild?: boolean;
    childs: OrgchartTreeItem<T>[]
}