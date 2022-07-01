<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\HttpFoundation\Response;
use DB;

class OrderController extends Controller
{

    public function index(Request $request)
    {
        $page       = $request->get("page")==null?1:(int)$request->get("page");
        $perpage    = $request->get("perpage")==null?2:(int)$request->get("perpage");
        $data       = DB::table("view_order");
        $datas      = [];
        if(count($data->get()) > 0){
            $response   = [
                "status"    => true,
                "pagination"=> [
                    "perpage"       => $perpage,
                    "total"         => count($data->get()),
                    "current_page"  => $page
                ]
            ];
                
            foreach($data->paginate($perpage) as $order){
                $order->product=[];
                $order->payment_method=[];
                $product      = DB::table("view_detail_product_order")->where("order_id",$order->order_id)->get();
                $paymentMethod= DB::table("view_detail_payment_method_order")->where("order_id",$order->order_id)->get();
                foreach($product as $row){array_push($order->product,$row);}
                foreach($paymentMethod as $row){array_push($order->payment_method,$row);}
                array_push($datas,$order);
            }
            $response['data']=$datas;
            return response()->json($response,Response::HTTP_OK);
        }
        else{
            return response()->json(["status"=>false,"data"=>[],"pagination"=>[]],Response::HTTP_OK);
        }
        
    }


    public function store(Request $request){
        DB::beginTransaction();
        date_default_timezone_set('Asia/Jakarta');
        $getCode = DB::table("master_order")->selectRaw("MAX(id) AS id,MAX(RIGHT(code,4)) AS code_max")->whereRaw("DATE(created_at)","CURDATE()");
        $kd="0001";
        if($getCode->get()!=null){
            foreach($getCode->get() as $k){
                $tmp = ((int)$k->code_max)+1;
                $kd = sprintf("%04s", $tmp);
            }
        }

        $dataMasterOrder = [
            "code" => "KD#".date('dmy').$kd,
            "customer_address_id"=>$request->post("customer_address_id"),
            "total"=>$request->post("total")
        ];
        $order = Order::create($dataMasterOrder);
        $product=$request->post("product");
        $payment=$request->post("payment");
        $dataMasterOrder["product"]=[];
        $dataMasterOrder["payment"]=[];

        foreach($product as $row){
            $fieldDetail=[
                "order_id"=>$order->id,
                "product_id"=>$row["id"],
                "subtotal"=>$row["subtotal"],
                "qty"=>$row["qty"],
            ];
            array_push($dataMasterOrder["product"],$fieldDetail);
        }
        DB::table('detail_product_order')->insert($dataMasterOrder["product"]);
        foreach($payment as $row){
            $fieldDetail=[
                "order_id"=>$order->id,
                "payment_method_id"=>$row["id"],
            ];
            array_push($dataMasterOrder["payment"],$fieldDetail);
        }
        DB::table('detail_payment_method_order')->insert($dataMasterOrder["payment"]);
        $response['status']=true;
        $response['data']=$dataMasterOrder;
        DB::commit();
        return response()->json($response,Response::HTTP_OK);
    }

}