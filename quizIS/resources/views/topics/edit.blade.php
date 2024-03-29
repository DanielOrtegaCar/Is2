@extends('layouts.app')

@section('content')
    <h3 class="page-title">@lang('quickadmin.topics.title')</h3>
    
    {!! Form::model($topic, ['method' => 'PUT', 'route' => ['topics.update', $topic->id]]) !!}

    <div class="panel panel-default">
        <div class="panel-heading">
            @lang('quickadmin.edit')
        </div>

        <div class="panel-body">
            <div class="row">
                <div class="col-xs-12 form-group">
                    {!! Form::label('idetapa', 'Etapa*', ['class' => 'control-label']) !!}
                   {!! Form::select('idetapa', $etapas, old('idetapa'), ['class' => 'form-control']) !!}
                    {!! Form::label('title', 'Nombre*', ['class' => 'control-label']) !!}
                    {!! Form::text('title', old('title'), ['class' => 'form-control', 'placeholder' => '']) !!}
                     {!! Form::label('descripcion', 'descripcion', ['class' => 'control-label']) !!}
                    {!! Form::text('descripcion', old('descripcion'), ['class' => 'form-control', 'placeholder' => '']) !!}
                    <p class="help-block"></p>
                    @if($errors->has('title'))
                        <p class="help-block">
                            {{ $errors->first('title') }}
                        </p>
                    @endif
                </div>
            </div>
            
        </div>
    </div>

    {!! Form::submit(trans('quickadmin.update'), ['class' => 'btn btn-danger']) !!}
    {!! Form::close() !!}
@stop

