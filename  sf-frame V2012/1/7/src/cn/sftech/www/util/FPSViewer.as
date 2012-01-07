package cn.sftech.www.util
{
	import cn.sftech.www.view.SFApplication;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	import flash.utils.setTimeout;

	public class FPSViewer
	{
		public static var fps : Number = 0;
		
		private var timerFlag : int;
		
		public function FPSViewer()
		{
		}
		
		public static function showFPS() : void
		{
			var fpsViewer : FPSViewer = new FPSViewer();
			SFApplication.application.addEventListener(Event.ENTER_FRAME,fpsViewer.fps);
		}
		
		private function fps(event : Event) : void
		{
			var fps:String =  Number( 1000 / (getTimer() - timerFlag) ).toFixed(2);
			LogManager.print(fps + "  fps");
			timerFlag = getTimer();
		}
		
	}
}