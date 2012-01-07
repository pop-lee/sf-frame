package cn.sftech.www.event
{
	import flash.events.Event;
	
	public class SFInitializeEvent extends Event
	{
		public static const INITIALIZE_EVENT : String = "initializeEvent"
		
		public function SFInitializeEvent()
		{
			super(INITIALIZE_EVENT);
		}
	}
}