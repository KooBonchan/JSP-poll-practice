package beans;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PollListBean {
	private int pollId;
	private String question;
	private String startDate;
	private String endDate;
	private String writeDate;
	private boolean isCheckbox;
	private boolean isActive;
	
	public boolean checkIsActive() {
		LocalDate date = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		return((date.isEqual(start) || date.isAfter(start)) &&
				(date.isEqual(end) || date.isBefore(end)));
	}
}
