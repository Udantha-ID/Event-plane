package event.Review;

public class EventReview {

    private int id;
    private String title; // Changed from 'movie' to 'title'
    private int rating;
    private String review;
    private String reviewerName; // Renamed 'name' to 'reviewerName'
    private String reviewerEmail; // Renamed 'email' to 'reviewerEmail'

    // Constructor with all fields
    public EventReview(int id, String title, int rating, String review, String reviewerName, String reviewerEmail) {
        this.id = id;
        this.title = title;
        this.rating = rating;
        this.review = review;
        this.reviewerName = reviewerName;
        this.reviewerEmail = reviewerEmail;
    }

    // Constructor without ID (e.g., for new reviews without a set ID)
    public EventReview(String title, int rating, String review, String reviewerName, String reviewerEmail) {
        this.title = title;
        this.rating = rating;
        this.review = review;
        this.reviewerName = reviewerName;
        this.reviewerEmail = reviewerEmail;
    }

    // Getters
    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public int getRating() {
        return rating;
    }

    public String getReview() {
        return review;
    }

    public String getReviewerName() {
        return reviewerName;
    }

    public String getReviewerEmail() {
        return reviewerEmail;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public void setReviewerName(String reviewerName) {
        this.reviewerName = reviewerName;
    }

    public void setReviewerEmail(String reviewerEmail) {
        this.reviewerEmail = reviewerEmail;
    }
}
