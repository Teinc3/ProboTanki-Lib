package Renamed224
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.core.Wrapper;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renamed919;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   
   use namespace alternativa3d;
   
   public class Renamed6338 extends Mesh implements Renamed919
   {
      public static const Renamed5085:Number = 1000;
      
      private var battleService:BattleService;
      
      private var material:Material;
      
      private var Renamed5152:Vector.<Face>;
      
      private var uvs:Vector.<Point>;
      
      private var Renamed5153:Vector.<Vector3D>;
      
      public function Renamed6338(param1:Material, param2:BattleService)
      {
         this.uvs = new Vector.<Point>();
         this.Renamed5153 = new Vector.<Vector3D>();
         super();
         this.material = param1;
         this.battleService = param2;
         useShadowMap = false;
         useLight = false;
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         this.createGeometry();
         param2.Renamed621().Renamed1402(this);
      }
      
      private function createGeometry() : void
      {
         var _loc1_:Vertex = null;
         var _loc2_:Vertex = null;
         var _loc3_:Vertex = null;
         var _loc4_:Number = Renamed5085 * 0.5;
         var _loc5_:Number = Renamed5085 * 0.5;
         this.Renamed5153[0] = new Vector3D(0,_loc5_,0);
         this.Renamed5153[1] = new Vector3D(-_loc4_,0,0);
         this.Renamed5153[2] = new Vector3D(0,-_loc5_,0);
         this.Renamed5153[3] = new Vector3D(_loc4_,0,0);
         this.uvs[0] = new Point(0.5,-0.5);
         this.uvs[1] = new Point(-0.5,0.5);
         this.uvs[2] = new Point(0.5,1.5);
         this.uvs[3] = new Point(1.5,0.5);
         this.Renamed5152 = new Vector.<Face>();
         _loc1_ = this.createVertex(-_loc4_,0,0,-0.5,0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,_loc5_,0,0.5,-0.5);
         this.Renamed5152[0] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,-_loc5_,0,0.5,1.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(-_loc4_,0,0,-0.5,0.5);
         this.Renamed5152[1] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(_loc4_,0,0,1.5,0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,-_loc5_,0,0.5,1.5);
         this.Renamed5152[2] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,_loc5_,0,0.5,-0.5);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(_loc4_,0,0,1.5,0.5);
         this.Renamed5152[3] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
         _loc1_ = this.createVertex(0,0,0,0,0);
         _loc2_ = this.createVertex(0,0,0,0.5,0.5);
         _loc3_ = this.createVertex(0,0,0,0,0);
         this.Renamed5152[4] = this.createFace(_loc1_,_loc2_,_loc3_,this.material);
      }
      
      private function createVertex(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number) : Vertex
      {
         var _loc6_:Vertex;
         (_loc6_ = new Vertex()).x = param1;
         _loc6_.y = param2;
         _loc6_.z = param3;
         _loc6_.u = param4;
         _loc6_.v = param5;
         _loc6_.alternativa3d::next = alternativa3d::vertexList;
         alternativa3d::vertexList = _loc6_;
         return _loc6_;
      }
      
      private function createFace(param1:Vertex, param2:Vertex, param3:Vertex, param4:Material) : Face
      {
         var _loc5_:Face = null;
         (_loc5_ = new Face()).material = param4;
         _loc5_.alternativa3d::wrapper = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::vertex = param1;
         _loc5_.alternativa3d::wrapper.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::vertex = param2;
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next = new Wrapper();
         _loc5_.alternativa3d::wrapper.alternativa3d::next.alternativa3d::next.alternativa3d::vertex = param3;
         _loc5_.alternativa3d::normalX = 0;
         _loc5_.alternativa3d::normalY = 0;
         _loc5_.alternativa3d::normalZ = 1;
         _loc5_.alternativa3d::offset = 0;
         _loc5_.alternativa3d::next = alternativa3d::faceList;
         alternativa3d::faceList = _loc5_;
         return _loc5_;
      }
      
      public function Renamed5118(param1:Camera3D) : void
      {
         rotationX = param1.rotationX - Math.PI;
         rotationY = 0;
         rotationZ = param1.rotationZ;
      }
      
      public function render(param1:int, param2:int) : void
      {
         this.Renamed5118(this.battleService.Renamed621().Renamed739());
      }
   }
}

