<tc-card *ngIf="<?= $entity_var_singular ?>Srv.resourceName|showable" [tcGradient]="lightGradient">
    <tc-card [view]="secondViewBorder" [outline]="true" [padding]="0.5">
        <div class="row">
            <div class="d-none d-md-block col-md-1">
                <i class="icofont icofont-data icofont-4x"></i>
            </div>
            <div class="col-12 col-md-7">
                <blockquote class="blockquote">
                    <p class="mb-0">{{title}}</p>
                    <footer class="blockquote-footer"> <cite title="Source Title">sous titre</cite></footer>
                </blockquote>
            </div>
            <div class="col-12 col-md-4">
                <button *ngIf="<?= $entity_var_singular ?>Srv.resourceName|editable"
                    [routerLink]="['/'+orientation,<?= $entity_var_singular ?>Srv.getRoutePrefixWithoutSlash(),entity?.id,'edit']"
                    class="float-right ml-1" tc-button view="warning" beforeIcon="icofont-edit"></button>
                <button (click)="remove(entity)" *ngIf="<?= $entity_var_singular ?>Srv.resourceName|deletable" tc-button
                    view="error" beforeIcon="icofont-trash" class=" float-right ml-1"></button>
                <button (click)="findEntity(entity.id)" class="float-right ml-1" tc-button view="accent"
                    beforeIcon="icofont-refresh"></button>
                <button tc-button class="float-right" (click)="location.back()"
                    beforeIcon="icofont-reply"></button>
            </div>
        </div>
    </tc-card>
    <div class="row">
        <div class="col-12 col-md-4">
            <tc-card [outline]="true" [view]="secondViewBorder" [title]="title" [tcGradient]="secondGradient">
                <table class="table">
                <?php foreach ($entity_fields as $field): ?>
                    <?php if($field['fieldName']!='id'){ ?>
                        <tr>
                            <th><?= ucfirst($field['fieldName']) ?></th>
                            <td>
                                <span *ngIf="<?= 'entity?.'.$field['fieldName'] ?>">{{ <?= 'entity?.'.$field['fieldName'] ?> }}</span>
                                <tc-badge view="error" *ngIf="!<?= 'entity?.'.$field['fieldName'] ?>">Indéfinie</tc-badge>
                            </td>
                        </tr>
                    <?php } ?>
                <?php endforeach; ?>
                </table>
            </tc-card>
        </div>
    </div>
</tc-card>
<app-access-denied *ngIf="!(<?= $entity_var_singular ?>Srv.resourceName|showable)"></app-access-denied>