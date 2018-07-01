@extends('layouts.app')

@section('content')
    <h3 class="page-title">@lang('quickadmin.questions.title')</h3>
    
    <div class="panel panel-default">
        <div class="panel-heading">
            Pregunta
        </div>
        
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
                    <table class="table table-bordered table-striped">
                    <tr><th>@lang('quickadmin.questions.fields.etapa')</th>
                    <td>{{ $question->etapa->idetapa }}</td></tr>
                    <tr><th>@lang('Topico')</th>
                    <td>{{ $question->topic->title or '' }}</td></tr>
                    
                    <tr><th>@lang('quickadmin.questions.fields.question-text')</th>
                    <td>{!! $question->question_text !!}</td></tr>

                <tr><th>@lang('quickadmin.questions.fields.answer-explanation')</th>
                    <td>{!! $question->answer_explanation !!}</td></tr><tr><th>Ponderacion</th>
                    <td>{{ $question->ponderation }}</td></tr>

                    </table>
                </div>
            </div>

            <p>&nbsp;</p>
             <p>&nbsp;</p>
              <p>&nbsp;</p>


            <table class="table table-bordered table-striped {{ count($questions_options) > 0 ? 'datatable' : '' }}" >
                <thead>
                    <tr>
                       
                        
                        <th>@lang('quickadmin.questions-options.fields.option')</th>
                        <th>Puntaje</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($questions_options) > 0)
                        @foreach ($questions_options as $questions_option)
                            <tr data-entry-id="{{ $questions_option->id }}">
                               
                                
                                <td>{{ $questions_option->option }}</td>
                                <!--<td>{{ $questions_option->correct == 1 ? 'Yes' : 'No' }}</td>-->
                                <td>{{ $questions_option->ponderation}}</td>
                                <td>
                                    <a href="{{ route('questions_options.show',[$questions_option->id]) }}" class="btn btn-xs btn-primary">@lang('quickadmin.view')</a>
                                    <a href="{{ route('questions_options.edit',[$questions_option->id]) }}" class="btn btn-xs btn-info">@lang('quickadmin.edit')</a>
                                    {!! Form::open(array(
                                        'style' => 'display: inline-block;',
                                        'method' => 'DELETE',
                                        'onsubmit' => "return confirm('".trans("quickadmin.are_you_sure")."');",
                                        'route' => ['questions_options.destroy', $questions_option->id])) !!}
                                    {!! Form::submit(trans('quickadmin.delete'), array('class' => 'btn btn-xs btn-danger')) !!}
                                    {!! Form::close() !!}
                                </td>
                            </tr>
                        @endforeach
                    @else
                        <tr>
                            <td colspan="5">@lang('quickadmin.no_entries_in_table')</td>
                        </tr>
                    @endif
                </tbody>
            </table>
   
 </div>
            </div>

            <a href="{{ route('questions.index') }}" class="btn btn-default">@lang('quickadmin.back_to_list')</a>
        </div>
    </div>
@stop