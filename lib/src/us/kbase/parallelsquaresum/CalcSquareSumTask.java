
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumTask</p>
 * 
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "i"
})
public class CalcSquareSumTask {

    @JsonProperty("i")
    private Long i;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("i")
    public Long getI() {
        return i;
    }

    @JsonProperty("i")
    public void setI(Long i) {
        this.i = i;
    }

    public CalcSquareSumTask withI(Long i) {
        this.i = i;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((("CalcSquareSumTask"+" [i=")+ i)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
