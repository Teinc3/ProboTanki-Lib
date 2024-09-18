package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   public function removeDisplayObject(param1:DisplayObject) : void
   {
      if(param1 != null && param1.parent != null)
      {
         param1.parent.removeChild(param1);
      }
   }
}

