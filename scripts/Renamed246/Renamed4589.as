package Renamed3253
{
   import alternativa.osgi.service.logging.LogService;
   import Renamed320.Renamed6646;
   import Renamed320.Renamed6647;
   import Renamed320.Renamed4658;
   import flash.filters.BitmapFilter;
   import flash.filters.ColorMatrixFilter;
   import platform.client.fp10.core.model.ObjectLoadListener;
   
   public class Renamed4589 extends Renamed6646 implements Renamed4658, ObjectLoadListener, Renamed3254
   {
      [Inject]
      public static var logService:LogService;
      
      private static var Renamed6648:ColorMatrixFilter = new ColorMatrixFilter();
      
      public function Renamed4589()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _loc1_:Renamed6647 = null;
         var _loc2_:Object = {};
         var _loc3_:Vector.<Renamed6647> = getInitParam().data;
         for each(_loc1_ in _loc3_)
         {
            _loc2_[_loc1_.key] = new Renamed6649(_loc1_);
         }
         putData(Object,_loc2_);
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var _loc2_:Object = Object(getData(Object));
         var _loc3_:Renamed6649 = _loc2_[param1];
         if(_loc3_ != null)
         {
            return _loc3_.createFilter();
         }
         return Renamed6648;
      }
   }
}

