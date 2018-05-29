<?php $__env->startSection('content'); ?>
    <h3 class="page-title"><?php echo app('translator')->getFromJson('quickadmin.users.title'); ?></h3>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            <?php echo app('translator')->getFromJson('quickadmin.view'); ?>
        </div>
        
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <table class="table table-bordered table-striped">
                        <tr><th><?php echo app('translator')->getFromJson('quickadmin.users.fields.name'); ?></th>
                    <td><?php echo e($user->name); ?></td></tr><tr><th><?php echo app('translator')->getFromJson('quickadmin.users.fields.email'); ?></th>
                    <td><?php echo e($user->email); ?></td></tr><tr><th><?php echo app('translator')->getFromJson('quickadmin.users.fields.password'); ?></th>
                    <td>---</td></tr><tr><th><?php echo app('translator')->getFromJson('quickadmin.users.fields.role'); ?></th>
                    <td><?php echo e(isset($user->role->title) ? $user->role->title : ''); ?></td></tr><tr><th><?php echo app('translator')->getFromJson('quickadmin.users.fields.remember-token'); ?></th>
                    <td><?php echo e($user->remember_token); ?></td></tr>
                    </table>
                </div>
            </div>

            <p>&nbsp;</p>

            <a href="<?php echo e(route('users.index')); ?>" class="btn btn-default"><?php echo app('translator')->getFromJson('quickadmin.back_to_list'); ?></a>
        </div>
    </div>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.app', array_except(get_defined_vars(), array('__data', '__path')))->render(); ?>