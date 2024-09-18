package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   import flash.display.Sprite;
   
   use namespace alternativa3d;
   
   public class Debug
   {
      public static const BOUNDS:int = 8;
      
      public static const EDGES:int = 16;
      
      public static const NODES:int = 128;
      
      public static const LIGHTS:int = 256;
      
      public static const BONES:int = 512;
      
      private static const boundVertexList:Vertex = Vertex.alternativa3d::createList(8);
      
      private static const nodeVertexList:Vertex = Vertex.alternativa3d::createList(4);
      
      public function Debug()
      {
         super();
      }
      
      alternativa3d static function drawEdges(param1:Camera3D, param2:Face, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Wrapper = null;
         var _loc6_:Vertex = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc9_:Number = param1.alternativa3d::viewSizeX;
         var _loc10_:Number = param1.alternativa3d::viewSizeY;
         var _loc11_:Sprite = param1.view.alternativa3d::canvas;
         _loc11_.graphics.lineStyle(0,param3);
         var _loc12_:Face = param2;
         while(_loc12_ != null)
         {
            _loc5_ = _loc12_.alternativa3d::wrapper;
            _loc6_ = _loc5_.alternativa3d::vertex;
            _loc4_ = 1 / _loc6_.alternativa3d::cameraZ;
            _loc7_ = _loc6_.alternativa3d::cameraX * _loc9_ * _loc4_;
            _loc8_ = _loc6_.alternativa3d::cameraY * _loc10_ * _loc4_;
            _loc11_.graphics.moveTo(_loc7_,_loc8_);
            _loc5_ = _loc5_.alternativa3d::next;
            while(_loc5_ != null)
            {
               _loc6_ = _loc5_.alternativa3d::vertex;
               _loc4_ = 1 / _loc6_.alternativa3d::cameraZ;
               _loc11_.graphics.lineTo(_loc6_.alternativa3d::cameraX * _loc9_ * _loc4_,_loc6_.alternativa3d::cameraY * _loc10_ * _loc4_);
               _loc5_ = _loc5_.alternativa3d::next;
            }
            _loc11_.graphics.lineTo(_loc7_,_loc8_);
            _loc12_ = _loc12_.alternativa3d::processNext;
         }
      }
      
      public static function drawBounds(param1:Camera3D, param2:Object3D, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:int = -1, param10:Number = 1) : void
      {
         var _loc11_:Vertex = null;
         var _loc12_:Number = NaN;
         var _loc13_:Vertex;
         (_loc13_ = boundVertexList).x = param3;
         _loc13_.y = param4;
         _loc13_.z = param5;
         var _loc14_:Vertex;
         (_loc14_ = _loc13_.alternativa3d::next).x = param6;
         _loc14_.y = param4;
         _loc14_.z = param5;
         var _loc15_:Vertex;
         (_loc15_ = _loc14_.alternativa3d::next).x = param3;
         _loc15_.y = param7;
         _loc15_.z = param5;
         var _loc16_:Vertex;
         (_loc16_ = _loc15_.alternativa3d::next).x = param6;
         _loc16_.y = param7;
         _loc16_.z = param5;
         var _loc17_:Vertex;
         (_loc17_ = _loc16_.alternativa3d::next).x = param3;
         _loc17_.y = param4;
         _loc17_.z = param8;
         var _loc18_:Vertex;
         (_loc18_ = _loc17_.alternativa3d::next).x = param6;
         _loc18_.y = param4;
         _loc18_.z = param8;
         var _loc19_:Vertex;
         (_loc19_ = _loc18_.alternativa3d::next).x = param3;
         _loc19_.y = param7;
         _loc19_.z = param8;
         var _loc20_:Vertex;
         (_loc20_ = _loc19_.alternativa3d::next).x = param6;
         _loc20_.y = param7;
         _loc20_.z = param8;
         _loc11_ = _loc13_;
         while(_loc11_ != null)
         {
            _loc11_.alternativa3d::cameraX = param2.alternativa3d::ma * _loc11_.x + param2.alternativa3d::mb * _loc11_.y + param2.alternativa3d::mc * _loc11_.z + param2.alternativa3d::md;
            _loc11_.alternativa3d::cameraY = param2.alternativa3d::me * _loc11_.x + param2.alternativa3d::mf * _loc11_.y + param2.alternativa3d::mg * _loc11_.z + param2.alternativa3d::mh;
            _loc11_.alternativa3d::cameraZ = param2.alternativa3d::mi * _loc11_.x + param2.alternativa3d::mj * _loc11_.y + param2.alternativa3d::mk * _loc11_.z + param2.alternativa3d::ml;
            if(_loc11_.alternativa3d::cameraZ <= 0)
            {
               return;
            }
            _loc11_ = _loc11_.alternativa3d::next;
         }
         var _loc21_:Number = param1.alternativa3d::viewSizeX;
         var _loc22_:Number = param1.alternativa3d::viewSizeY;
         _loc11_ = _loc13_;
         while(_loc11_ != null)
         {
            _loc12_ = 1 / _loc11_.alternativa3d::cameraZ;
            _loc11_.alternativa3d::cameraX = _loc11_.alternativa3d::cameraX * _loc21_ * _loc12_;
            _loc11_.alternativa3d::cameraY = _loc11_.alternativa3d::cameraY * _loc22_ * _loc12_;
            _loc11_ = _loc11_.alternativa3d::next;
         }
         var _loc23_:Sprite = param1.view.alternativa3d::canvas;
         _loc23_.graphics.lineStyle(0,param9 < 0 ? (param2.alternativa3d::culling > 0 ? uint(16776960) : uint(65280)) : uint(param9),param10);
         _loc23_.graphics.moveTo(_loc13_.alternativa3d::cameraX,_loc13_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc14_.alternativa3d::cameraX,_loc14_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc16_.alternativa3d::cameraX,_loc16_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc15_.alternativa3d::cameraX,_loc15_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc13_.alternativa3d::cameraX,_loc13_.alternativa3d::cameraY);
         _loc23_.graphics.moveTo(_loc17_.alternativa3d::cameraX,_loc17_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc18_.alternativa3d::cameraX,_loc18_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc20_.alternativa3d::cameraX,_loc20_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc19_.alternativa3d::cameraX,_loc19_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc17_.alternativa3d::cameraX,_loc17_.alternativa3d::cameraY);
         _loc23_.graphics.moveTo(_loc13_.alternativa3d::cameraX,_loc13_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc17_.alternativa3d::cameraX,_loc17_.alternativa3d::cameraY);
         _loc23_.graphics.moveTo(_loc14_.alternativa3d::cameraX,_loc14_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc18_.alternativa3d::cameraX,_loc18_.alternativa3d::cameraY);
         _loc23_.graphics.moveTo(_loc16_.alternativa3d::cameraX,_loc16_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc20_.alternativa3d::cameraX,_loc20_.alternativa3d::cameraY);
         _loc23_.graphics.moveTo(_loc15_.alternativa3d::cameraX,_loc15_.alternativa3d::cameraY);
         _loc23_.graphics.lineTo(_loc19_.alternativa3d::cameraX,_loc19_.alternativa3d::cameraY);
      }
      
      alternativa3d static function drawKDNode(param1:Camera3D, param2:Object3D, param3:int, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number, param10:Number, param11:Number) : void
      {
         var _loc12_:Vertex = null;
         var _loc13_:Number = NaN;
         var _loc14_:Vertex = nodeVertexList;
         var _loc16_:Vertex;
         var _loc15_:Vertex;
         var _loc17_:Vertex = (_loc16_ = (_loc15_ = _loc14_.alternativa3d::next).alternativa3d::next).alternativa3d::next;
         if(param3 == 0)
         {
            _loc14_.x = param4;
            _loc14_.y = param6;
            _loc14_.z = param10;
            _loc15_.x = param4;
            _loc15_.y = param9;
            _loc15_.z = param10;
            _loc16_.x = param4;
            _loc16_.y = param9;
            _loc16_.z = param7;
            _loc17_.x = param4;
            _loc17_.y = param6;
            _loc17_.z = param7;
         }
         else if(param3 == 1)
         {
            _loc14_.x = param8;
            _loc14_.y = param4;
            _loc14_.z = param10;
            _loc15_.x = param5;
            _loc15_.y = param4;
            _loc15_.z = param10;
            _loc16_.x = param5;
            _loc16_.y = param4;
            _loc16_.z = param7;
            _loc17_.x = param8;
            _loc17_.y = param4;
            _loc17_.z = param7;
         }
         else
         {
            _loc14_.x = param5;
            _loc14_.y = param6;
            _loc14_.z = param4;
            _loc15_.x = param8;
            _loc15_.y = param6;
            _loc15_.z = param4;
            _loc16_.x = param8;
            _loc16_.y = param9;
            _loc16_.z = param4;
            _loc17_.x = param5;
            _loc17_.y = param9;
            _loc17_.z = param4;
         }
         _loc12_ = _loc14_;
         while(_loc12_ != null)
         {
            _loc12_.alternativa3d::cameraX = param2.alternativa3d::ma * _loc12_.x + param2.alternativa3d::mb * _loc12_.y + param2.alternativa3d::mc * _loc12_.z + param2.alternativa3d::md;
            _loc12_.alternativa3d::cameraY = param2.alternativa3d::me * _loc12_.x + param2.alternativa3d::mf * _loc12_.y + param2.alternativa3d::mg * _loc12_.z + param2.alternativa3d::mh;
            _loc12_.alternativa3d::cameraZ = param2.alternativa3d::mi * _loc12_.x + param2.alternativa3d::mj * _loc12_.y + param2.alternativa3d::mk * _loc12_.z + param2.alternativa3d::ml;
            if(_loc12_.alternativa3d::cameraZ <= 0)
            {
               return;
            }
            _loc12_ = _loc12_.alternativa3d::next;
         }
         var _loc18_:Number = param1.alternativa3d::viewSizeX;
         var _loc19_:Number = param1.alternativa3d::viewSizeY;
         _loc12_ = _loc14_;
         while(_loc12_ != null)
         {
            _loc13_ = 1 / _loc12_.alternativa3d::cameraZ;
            _loc12_.alternativa3d::cameraX = _loc12_.alternativa3d::cameraX * _loc18_ * _loc13_;
            _loc12_.alternativa3d::cameraY = _loc12_.alternativa3d::cameraY * _loc19_ * _loc13_;
            _loc12_ = _loc12_.alternativa3d::next;
         }
         var _loc20_:Sprite = param1.view.alternativa3d::canvas;
         _loc20_.graphics.lineStyle(0,param3 == 0 ? uint(16711680) : (param3 == 1 ? uint(65280) : uint(255)),param11);
         _loc20_.graphics.moveTo(_loc14_.alternativa3d::cameraX,_loc14_.alternativa3d::cameraY);
         _loc20_.graphics.lineTo(_loc15_.alternativa3d::cameraX,_loc15_.alternativa3d::cameraY);
         _loc20_.graphics.lineTo(_loc16_.alternativa3d::cameraX,_loc16_.alternativa3d::cameraY);
         _loc20_.graphics.lineTo(_loc17_.alternativa3d::cameraX,_loc17_.alternativa3d::cameraY);
         _loc20_.graphics.lineTo(_loc14_.alternativa3d::cameraX,_loc14_.alternativa3d::cameraY);
      }
      
      alternativa3d static function drawBone(param1:Camera3D, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:int) : void
      {
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         var _loc11_:Number = NaN;
         var _loc12_:Sprite = null;
         var _loc13_:Number = param4 - param2;
         var _loc14_:Number = param5 - param3;
         var _loc15_:Number = Math.sqrt(_loc13_ * _loc13_ + _loc14_ * _loc14_);
         if(_loc15_ > 0.001)
         {
            _loc13_ /= _loc15_;
            _loc14_ /= _loc15_;
            _loc8_ = _loc14_ /= _loc15_ * param6;
            _loc9_ = -_loc13_ * param6;
            _loc10_ = -_loc14_ * param6;
            _loc11_ = _loc13_ * param6;
            if(_loc15_ > param6 * 2)
            {
               _loc15_ = param6;
            }
            else
            {
               _loc15_ /= 2;
            }
            _loc12_ = param1.view.alternativa3d::canvas;
            _loc12_.graphics.lineStyle(1,param7);
            _loc12_.graphics.beginFill(param7,0.6);
            _loc12_.graphics.moveTo(param2,param3);
            _loc12_.graphics.lineTo(param2 + _loc13_ * _loc15_ + _loc8_,param3 + _loc14_ * _loc15_ + _loc9_);
            _loc12_.graphics.lineTo(param4,param5);
            _loc12_.graphics.lineTo(param2 + _loc13_ * _loc15_ + _loc10_,param3 + _loc14_ * _loc15_ + _loc11_);
            _loc12_.graphics.lineTo(param2,param3);
            _loc12_.graphics.endFill();
         }
      }
   }
}

