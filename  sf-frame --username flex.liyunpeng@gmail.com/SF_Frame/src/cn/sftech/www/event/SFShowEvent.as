package cn.sftech.www.event
{
	import flash.events.Event;
	
	public class SFShowEvent extends Event
	{
		public static const SHOW_EVENT : String = "showEvent";
		
		public function SFShowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}