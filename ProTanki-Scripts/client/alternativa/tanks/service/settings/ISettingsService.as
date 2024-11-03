package alternativa.tanks.service.settings
{
   import flash.events.IEventDispatcher;
   
   public interface ISettingsService extends IEventDispatcher
   {
      function get showDropZones() : Boolean;
      
      function set showDropZones(param1:Boolean) : void;
      
      function get showSkyBox() : Boolean;
      
      function get showFPS() : Boolean;
      
      function get showChat() : Boolean;
      
      function get mipMapping() : Boolean;
      
      function get inverseBackDriving() : Boolean;
      
      function get bgSound() : Boolean;
      
      function get muteSound() : Boolean;
      
      function set muteSound(param1:Boolean) : void;
      
      function get alternateCamera() : Boolean;
      
      function get adaptiveFPS() : Boolean;
      
      function get shadows() : Boolean;
      
      function get Renamed2472() : Boolean;
      
      function get dust() : Boolean;
      
      function get ssao() : Boolean;
      
      function get fog() : Boolean;
      
      function get dynamicLighting() : Boolean;
      
      function get antialiasing() : Boolean;
      
      function get dynamicShadows() : Boolean;
      
      function get graphicsAutoQuality() : Boolean;
      
      function get Renamed3722() : Number;
      
      function set Renamed3722(param1:Number) : void;
      
      function Renamed2205() : void;
      
      function get mouseControl() : Boolean;
      
      function getEmail() : String;
      
      function Renamed2286(param1:String, param2:Boolean) : void;
      
      function Renamed3723() : Boolean;
      
      function Renamed3724() : Boolean;
      
      function Renamed2184() : Boolean;
      
      function Renamed3725(param1:Boolean) : void;
      
      function get mouseSensitivity() : int;
      
      function get mouseYInverse() : Boolean;
      
      function get mouseYInverseShaftAim() : Boolean;
      
      function get Renamed2195() : Boolean;
      
      function set Renamed2195(param1:Boolean) : void;
      
      function get showDamage() : Boolean;
      
      function Renamed3726(param1:Renamed2069, param2:Object) : void;
   }
}

