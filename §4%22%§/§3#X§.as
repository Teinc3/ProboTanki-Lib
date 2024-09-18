package §4"%§
{
   import alternativa.osgi.service.logging.LogService;
   import §catch catch true§.§=!§;
   import §catch catch true§.§@?§;
   import §catch catch true§.§super const default§;
   import flash.filters.BitmapFilter;
   import flash.filters.ColorMatrixFilter;
   import platform.client.fp10.core.model.ObjectLoadListener;
   
   public class §3#X§ extends §=!§ implements §super const default§, ObjectLoadListener, §80§
   {
      [Inject]
      public static var logService:LogService;
      
      private static var §>#E§:ColorMatrixFilter = new ColorMatrixFilter();
      
      public function §3#X§()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _loc1_:§@?§ = null;
         var _loc2_:Object = {};
         var _loc3_:Vector.<§@?§> = getInitParam().data;
         for each(_loc1_ in _loc3_)
         {
            _loc2_[_loc1_.key] = new §7"d§(_loc1_);
         }
         putData(Object,_loc2_);
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var _loc2_:Object = Object(getData(Object));
         var _loc3_:§7"d§ = _loc2_[param1];
         if(_loc3_ != null)
         {
            return _loc3_.createFilter();
         }
         return §>#E§;
      }
   }
}

