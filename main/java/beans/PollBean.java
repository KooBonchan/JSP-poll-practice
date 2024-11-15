package beans;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PollBean {
	private int pollId;
	private List<PollItem> items = new ArrayList<>();
	public int getTotal() {
		return items.stream().mapToInt(PollItem::getCount).sum();
	}
}
