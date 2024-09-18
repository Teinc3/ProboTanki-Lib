package Renamed211
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.Object3DContainer;
   import flash.utils.Dictionary;
   
   public class Renamed1341 implements Renamed908
   {
      private var container:Object3DContainer;
      
      public function Renamed1341(param1:Object3DContainer = null)
      {
         this.objects = new Dictionary();
         this.container = new Object3DContainer();
         super();
         this.Renamed1418(param1);
      }
      
      public function addChild(param1:Object3D) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(!this.objects[param1])
         {
            this.objects[param1] = true;
            this.container.addChild(param1);
         }
      }
      
      public function addChildAt(param1:Object3D, param2:int) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(!this.objects[param1])
         {
            this.objects[param1] = true;
            this.container.addChildAt(param1,param2);
         }
      }
      
      public function Renamed6192(param1:Vector.<Object3D>) : void
      {
         var _loc2_:Object3D = null;
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         for each(_loc2_ in param1)
         {
            this.addChild(_loc2_);
         }
      }
      
      public function removeChild(param1:Object3D) : void
      {
         if(param1 == null)
         {
            throw new ArgumentError("Parameter is null");
         }
         if(this.objects[param1])
         {
            delete this.objects[param1];
            this.container.removeChild(param1);
         }
      }
      
      public function Renamed1418(param1:Object3DContainer) : void
      {
         var _loc2_:Vector.<Object3D> = this.Renamed6193();
         this.container = param1 || new Object3DContainer();
         this.Renamed6192(_loc2_);
      }
      
      private function Renamed6193() : Vector.<Object3D>
      {
         var _loc1_:* = undefined;
         var _loc2_:Vector.<Object3D> = new Vector.<Object3D>();
         for(_loc1_ in this.objects)
         {
            delete this.objects[_loc1_];
            this.container.removeChild(_loc1_);
            _loc2_.push(_loc1_);
         }
         return _loc2_;
      }
   }
}

