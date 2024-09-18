package alternativa.utils
{
   public function removeDisplayObjectChildren(param1:DisplayObjectContainer) : void
   {
      while(param1.numChildren > 0)
      {
         param1.removeChildAt(param1.numChildren - 1);
      }
   }
}

