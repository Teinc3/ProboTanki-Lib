package alternativa.tanks.service.panel
{
   import forms.MainPanel;
   
   public interface IPanelView
   {
      function Renamed2159(param1:Boolean, param2:Boolean, param3:Boolean = false, param4:Boolean = false, param5:Boolean = false) : void;
      
      function Renamed2160() : MainPanel;
      
      function lock() : void;
      
      function unlock() : void;
      
      function showAlert(param1:String) : void;
   }
}

