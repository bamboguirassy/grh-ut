import { BamboHttpService } from '../services/bambo-http.service';
import { ToastrService } from 'ngx-toastr';
import { BamboAbstractObject } from '../classes/bambo-abstract-object';
import { first } from 'rxjs/operators';

export abstract class BamboAbstractService {

  protected routePrefix: string;
  public resourceName: string;

  constructor(public httpSrv: BamboHttpService, public toastr: ToastrService) { }

  findAll() {
    return this.httpSrv.get(this.routePrefix).pipe(first());
  }

  findOneById(id: number) {
    return this.httpSrv.get(this.routePrefix + id).pipe(first());
  }

  create(item: BamboAbstractObject) {
    return this.httpSrv.post(this.routePrefix + 'create', item).pipe(first());
  }

  update(item: BamboAbstractObject) {
    return this.httpSrv.put(this.routePrefix + item.id + '/edit', item).pipe(first());
  }

  clone(originalId: number, clone: BamboAbstractObject) {
    return this.httpSrv.put(this.routePrefix + originalId + '/clone', clone).pipe(first());
  }

  remove(item: BamboAbstractObject) {
    return this.httpSrv.delete(this.routePrefix + item.id).pipe(first());
  }

  getData(url) {
    return this.httpSrv.get(url)
    .pipe(first());
  }

  public getRoutePrefix(): string {
    return this.routePrefix;
  }

  public getRoutePrefixWithoutSlash(): string {
    return this.routePrefix.slice(0,-1);
  }
}