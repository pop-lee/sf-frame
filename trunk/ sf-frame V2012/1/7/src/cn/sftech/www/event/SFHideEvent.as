package cn.sftech.www.event
{
	import flash.events.Event;
	
	public class SFHideEvent extends Event
	{
		public static const HIDE_EVENT : String = "hideEvent";
		
		public function SFHideEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}