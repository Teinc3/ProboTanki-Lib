package alternativa.tanks.help
{
   import flash.text.TextFormat;
   
   public interface IHelpService
   {
      function registerHelper(param1:String, param2:int, param3:Helper, param4:Boolean) : void;
      
      function unregisterHelper(param1:String, param2:int) : void;
      
      function showHelper(param1:String, param2:int, param3:Boolean = false) : void;
      
      function showHelperIfAble(param1:String, param2:int, param3:Boolean = false) : void;
      
      function hideHelper(param1:String, param2:int) : void;
      
      function hideAllHelpers() : void;
      
      function showHelp() : void;
      
      function hideHelp() : void;
      
      function setHelperTextFormat(param1:TextFormat, param2:Boolean) : void;
      
      function pushState() : void;
      
      function popState() : void;
      
      function lock() : void;
      
      function unlock() : void;
   }
}

