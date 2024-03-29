<?php

namespace App\Http\Controllers;

use Auth;
use DB;
use App\Empresa;
use App\Test;
use App\TestAnswer;
use Illuminate\Http\Request;
use App\Http\Requests\StoreResultsRequest;
use App\Http\Requests\UpdateResultsRequest;

class ResultsController extends Controller
{
    public function __construct()
    {
        $this->middleware('admin')->except('index', 'show');
    }

    /**
     * Display a listing of Result.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
        $results = Empresa::whereNull('deleted_at')->where('user_id','<>',1)->get();


        if (!Auth::user()->isAdmin()) {
            $results = $results->where('user_id', '=', Auth::id());
        }

        foreach ($results as $key) {
            $c_aux = count(DB::table('etapas')->where('id','=',$key->etapa)->pluck('Nombre'));
            if($c_aux){
                $aux = DB::table('etapas')->where('id','=',$key->etapa)->pluck('Nombre');
                $key->etapa = $aux[0];
            }
            $c_aux2 = count(DB::table('tests')->where('user_id','=',$key->id)->pluck('id'));
            if($c_aux2){
                $aux2 = DB::table('tests')->where('user_id','=',$key->id)->pluck('id');
                $key->test = $aux2[0];
            }
            


        }
        $id = Auth::user()->getId();

        $empresas = DB::table('empresas')->where('user_id', '=', $id)->where('deleted_at','=',NULL)->pluck('id');
        $aux_emp = DB::table('empresas')->where('user_id', '=', $id)->where('deleted_at','=',NULL);

        $emp_id = $aux_emp->pluck('id');

        $test = Test::where('id',$emp_id[0]);
        $test1 = Test::where('user_id',$id);
        $test_id = $test1->pluck('id');

        $fecha_test = $test->pluck('created_at');
        $nombre_empresa = $aux_emp->pluck('Nombre');
        $nota=DB::table('empresas')->where('user_id', '=',$id)->where('deleted_at','=',NULL)->pluck('nota');
        $etapas=DB::table('empresas')->where('user_id', '=',$id)->where('deleted_at','=',NULL)->pluck('etapa');
        if(!empty($etapas)) {
        $etapa=DB::table('etapas')->where('id','=',$etapas[0])->pluck('Nombre');
        }
        else{

        $etapa=["Vacio",""];
        }
        return view('results.index', compact('results','test','id','empresas','etapa','nota','tests','fecha_test','test_id','nombre_empresa'));
    }

    /**
     * Display Result.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $test = Test::find($id)->load('user');

        if ($test) {
            $results = TestAnswer::where('test_id', $id)
                ->with('question')
                ->with('question.options')
                ->get()
            ;
        }

        return view('results.show', compact('test', 'results'));
    }
}
