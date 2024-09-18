package Renamed342
{
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class Renamed7941
   {
      private var Renamed7942:Dictionary;
      
      private var Renamed7943:Dictionary;
      
      private var Renamed7944:Dictionary;
      
      public function Renamed7941()
      {
         this.Renamed7942 = new Dictionary();
         this.Renamed7943 = new Dictionary();
         this.Renamed7944 = new Dictionary();
         super();
      }
      
      public function Renamed7945(param1:PropMesh, param2:String, param3:BSP) : void
      {
         var _loc4_:Renamed7946 = this.Renamed7947(param1,param2);
         _loc4_.Renamed7948(param3);
      }
      
      private function Renamed7947(param1:PropMesh, param2:String) : Renamed7946
      {
         return Renamed7946(this.Renamed7949(this.Renamed7942,param1,param2,Renamed7946));
      }
      
      public function Renamed7950(param1:PropMesh, param2:String, param3:Mesh, param4:String = null) : void
      {
         var _loc5_:Renamed7951 = this.Renamed7952(param1,param2);
         _loc5_.add(param3,param4);
      }
      
      private function Renamed7952(param1:PropMesh, param2:String) : Renamed7951
      {
         return Renamed7951(this.Renamed7949(this.Renamed7943,param1,param2,Renamed7951));
      }
      
      public function Renamed7953(param1:PropSprite, param2:Sprite3D) : void
      {
         var _loc3_:Renamed7954 = this.Renamed7955(param1);
         _loc3_.Renamed7953(param2);
      }
      
      private function Renamed7955(param1:PropSprite) : Renamed7954
      {
         return Renamed7954(this.Renamed7949(this.Renamed7944,param1,null,Renamed7954));
      }
      
      private function Renamed7949(param1:Dictionary, param2:PropObject, param3:String, param4:Class) : Renamed7939
      {
         var _loc5_:Dictionary = param1[param2];
         if(_loc5_ == null)
         {
            _loc5_ = new Dictionary();
            param1[param2] = _loc5_;
         }
         var _loc6_:Renamed7939 = _loc5_[param3];
         if(_loc6_ == null)
         {
            _loc6_ = new param4(param2,param3);
            _loc5_[param3] = _loc6_;
         }
         return _loc6_;
      }
      
      public function Renamed7956() : Vector.<Renamed7939>
      {
         var _loc1_:Vector.<Renamed7939> = new Vector.<Renamed7939>();
         this.Renamed7957(this.Renamed7942,_loc1_);
         this.Renamed7957(this.Renamed7943,_loc1_);
         this.Renamed7957(this.Renamed7944,_loc1_);
         return _loc1_;
      }
      
      private function Renamed7957(param1:Dictionary, param2:Vector.<Renamed7939>) : void
      {
         var _loc3_:Dictionary = null;
         var _loc4_:Renamed7939 = null;
         for each(_loc3_ in param1)
         {
            for each(_loc4_ in _loc3_)
            {
               param2.push(_loc4_);
            }
         }
      }
      
      public function clear() : void
      {
         this.Renamed7958(this.Renamed7943);
         this.Renamed7958(this.Renamed7942);
         this.Renamed7958(this.Renamed7944);
      }
      
      private function Renamed7958(param1:Dictionary) : void
      {
         var _loc2_:* = undefined;
         for(_loc2_ in param1)
         {
            clearDictionary(param1[_loc2_]);
            delete param1[_loc2_];
         }
      }
   }
}

