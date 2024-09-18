package alternativa.tanks.engine3d
{
   import alternativa.tanks.services.colortransform.Renamed1637;
   import alternativa.utils.clearDictionary;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import org1.osflash.signals.Signal;
   
   public class Renamed515 implements Renamed519
   {
      private static const Renamed1638:ColorTransform = new ColorTransform();
      
      private var colorTransform:ColorTransform;
      
      public function Renamed515()
      {
         this.Renamed1639 = new Signal();
         this.textures = new Dictionary();
         super();
      }
      
      public function clear() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = undefined;
         var _loc3_:BitmapData = null;
         if(this.colorTransform == null)
         {
            clearDictionary(this.textures);
         }
         else
         {
            _loc1_ = 0;
            for(_loc2_ in this.textures)
            {
               _loc3_ = this.textures[_loc2_];
               _loc3_.dispose();
               delete this.textures[_loc2_];
               _loc1_++;
            }
         }
      }
      
      public function getTexture(param1:BitmapData, param2:Boolean = true) : BitmapData
      {
         if(param1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         var _loc3_:BitmapData = this.textures[param1];
         if(_loc3_ == null)
         {
            _loc3_ = this.Renamed1640(param1,param2);
            this.textures[param1] = _loc3_;
         }
         return _loc3_;
      }
      
      private function Renamed1640(param1:BitmapData, param2:Boolean = true) : BitmapData
      {
         if(this.colorTransform == null)
         {
            return param1;
         }
         if(param2)
         {
            return Renamed1637.Renamed1641(param1,this.colorTransform);
         }
         return param1.clone();
      }
      
      public function Renamed1642(param1:Function) : void
      {
         this.Renamed1639.add(param1);
      }
      
      public function setColorTransform(param1:ColorTransform) : void
      {
         var _loc2_:ColorTransform = this.Renamed1643(param1);
         if(!Renamed1637.Renamed1644(this.colorTransform,_loc2_))
         {
            this.colorTransform = _loc2_;
            this.Renamed1645();
            this.Renamed1639.dispatch();
         }
      }
      
      private function Renamed1643(param1:ColorTransform) : ColorTransform
      {
         var _loc2_:ColorTransform = Renamed1637.clone(param1);
         if(Renamed1637.Renamed1644(_loc2_,Renamed1638))
         {
            return null;
         }
         return _loc2_;
      }
      
      private function Renamed1645() : void
      {
         var _loc1_:* = undefined;
         var _loc2_:BitmapData = null;
         var _loc3_:int = 0;
         for(_loc1_ in this.textures)
         {
            _loc2_ = this.textures[_loc1_];
            if(_loc2_ != _loc1_)
            {
               _loc2_.dispose();
               _loc3_++;
            }
            this.textures[_loc1_] = this.Renamed1640(_loc1_);
         }
      }
   }
}

