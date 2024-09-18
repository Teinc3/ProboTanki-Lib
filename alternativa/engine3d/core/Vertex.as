package alternativa.engine3d.core
{
   import alternativa.engine3d.alternativa3d;
   
   use namespace alternativa3d;
   
   public class Vertex
   {
      alternativa3d static var collector:Vertex;
      
      public var x:Number = 0;
      
      public var y:Number = 0;
      
      public var z:Number = 0;
      
      public var u:Number = 0;
      
      public var v:Number = 0;
      
      public var normalX:Number;
      
      public var normalY:Number;
      
      public var normalZ:Number;
      
      alternativa3d var cameraX:Number;
      
      alternativa3d var cameraY:Number;
      
      alternativa3d var cameraZ:Number;
      
      alternativa3d var offset:Number = 1;
      
      alternativa3d var transformId:int = 0;
      
      alternativa3d var drawId:int = 0;
      
      alternativa3d var index:int;
      
      alternativa3d var next:Vertex;
      
      alternativa3d var value:Vertex;
      
      public var id:Object;
      
      public function Vertex()
      {
         super();
      }
      
      alternativa3d static function createList(param1:int) : Vertex
      {
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = alternativa3d::collector;
         if(_loc3_ != null)
         {
            _loc2_ = _loc3_;
            while(param1 > 1)
            {
               _loc2_.alternativa3d::transformId = 0;
               _loc2_.alternativa3d::drawId = 0;
               if(_loc2_.alternativa3d::next == null)
               {
                  while(param1 > 1)
                  {
                     _loc2_.alternativa3d::next = new Vertex();
                     _loc2_ = _loc2_.alternativa3d::next;
                     param1--;
                  }
                  break;
               }
               _loc2_ = _loc2_.alternativa3d::next;
               param1--;
            }
            alternativa3d::collector = _loc2_.alternativa3d::next;
            _loc2_.alternativa3d::transformId = 0;
            _loc2_.alternativa3d::drawId = 0;
            _loc2_.alternativa3d::next = null;
         }
         else
         {
            _loc3_ = new Vertex();
            _loc2_ = _loc3_;
            while(param1 > 1)
            {
               _loc2_.alternativa3d::next = new Vertex();
               _loc2_ = _loc2_.alternativa3d::next;
               param1--;
            }
         }
         return _loc3_;
      }
      
      alternativa3d function create() : Vertex
      {
         var _loc1_:Vertex = null;
         if(alternativa3d::collector != null)
         {
            _loc1_ = alternativa3d::collector;
            alternativa3d::collector = _loc1_.alternativa3d::next;
            _loc1_.alternativa3d::next = null;
            _loc1_.alternativa3d::transformId = 0;
            _loc1_.alternativa3d::drawId = 0;
            return _loc1_;
         }
         return new Vertex();
      }
      
      public function toString() : String
      {
         return "[Vertex " + this.id + " " + this.x.toFixed(2) + ", " + this.y.toFixed(2) + ", " + this.z.toFixed(2) + ", " + this.u.toFixed(3) + ", " + this.v.toFixed(3) + "]";
      }
      
      public function destroy() : *
      {
         delete global[this];
      }
   }
}

