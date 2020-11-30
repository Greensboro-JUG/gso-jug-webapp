package com.gso.jug.model;

import lombok.Data;
import org.apache.commons.lang3.builder.EqualsBuilder;
import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import javax.persistence.*;

@Data
@Entity
@Table(name = "raffle", schema = "gsojug", uniqueConstraints={@UniqueConstraint(columnNames={"email"})})
public class Raffle {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String first_name;
    private String last_name;
    private String email;
    private boolean picked;

    @Override
    public boolean equals(Object object){
        return object instanceof Raffle && EqualsBuilder.reflectionEquals(this,object);
    }

    @Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

    @Override
    public int hashCode(){
        return HashCodeBuilder.reflectionHashCode(this);
    }
}
