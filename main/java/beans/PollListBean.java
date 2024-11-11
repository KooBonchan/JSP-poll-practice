package beans;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PollListBean {
	private int id;
	private String question;
	private String startDate;
	private String endDate;
	private String writeDate;
	private boolean isCheckbox;
	private boolean isActive;
}
