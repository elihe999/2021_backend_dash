<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Http\Middleware\BaseMiddleware;

class ApiAuth extends BaseMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        try{
            if ($this->auth->parseToken()->authenticate()){
                return $next($request);
            }
            return response()->json([
                'restful' => false,
                'message' => "未登录"
            ]);
        }catch (TokenExpiredException $exception){
            try{
                $token = $this->auth->refresh();
                Auth::guard('api')->onceUsingId($this->auth->manager()->getPayloadFactory()->buildClaimsCollection()->toPlainArray()['sub']);
                auth()->onceUsingId($this->auth->manager()->getPayloadFactory()->buildClaimsCollection()->toPlainArray()['sub']);
            }catch (JWTException $exception){
                return response()->json([
                    'restful' => false,
                    'message' => $exception->getMessage()
                ]);
            }
        }
        return $this->setAuthenticationHeader($next($request),$token);
    }
}
