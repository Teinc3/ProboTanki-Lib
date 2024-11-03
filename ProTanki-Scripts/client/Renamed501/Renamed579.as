package Renamed501
{
   import alternativa.tanks.service.IExternalEntranceService;
   import flash.utils.Dictionary;
   
   public class Renamed579 implements IExternalEntranceService
   {
      private static const VKONTAKTE:String = "vkontakte";
      
      private static const FACEBOOK:String = "facebook";
      
      private static const Renamed3786:String = "google";
      
      private var Renamed9865:Dictionary;
      
      public function Renamed579()
      {
         this.Renamed9865 = new Dictionary();
         super();
      }
      
      public function get Renamed3602() : Boolean
      {
         if(this.Renamed9865[VKONTAKTE])
         {
            return this.Renamed9865[VKONTAKTE];
         }
         return false;
      }
      
      public function get Renamed3603() : Boolean
      {
         if(this.Renamed9865[FACEBOOK])
         {
            return this.Renamed9865[FACEBOOK];
         }
         return false;
      }
      
      public function get Renamed3604() : Boolean
      {
         if(this.Renamed9865[Renamed3786])
         {
            return this.Renamed9865[Renamed3786];
         }
         return false;
      }
      
      public function setEnabled(param1:String, param2:Boolean) : void
      {
         this.Renamed9865[param1] = param2;
      }
   }
}

