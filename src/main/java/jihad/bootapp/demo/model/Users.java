package jihad.bootapp.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import static javax.persistence.GenerationType.IDENTITY;

@Entity
@Table(name = "user",
        catalog = "boot"
)
public class Users {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Integer id;
    @Column(name = "password", nullable = false, length = 45)
    private String password;
    @Column(name = "username", nullable = false, length = 45)
    private String username;
    @Column(name = "email", nullable = false, length = 45)
    private String email;
    @Column(name = "fullname", nullable = false, length = 100)
    private String fullname;

    public Users() {
    }

    public Users(Integer id) {
		super();
		this.id = id;
	}

	public Users(String password, String username) {
        this.password = password;
        this.username = username;
    }

    public Users(String password, String username, String email, String fullname) {
        this.password = password;
        this.username = username;
        this.email = email;
        this.fullname = fullname;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return this.fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
}
